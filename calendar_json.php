<?php

class CalendarJSON {

	var $language;
	var $local_time;
	var $template		= '';
	var $start_day;
	var $month_type		= 'long';
	var $day_type		= 'abr';
	var $show_next_prev	= FALSE;
	var $next_prev_url	= '';

	protected $days_of_week = array( 
		0 => 'Sunday',
		1 => 'Monday',
		2 => 'Tuesday',
		3 => 'Wednesday',
		4 => 'Thursday',
		5 => 'Friday',
		6 => 'Saturday'
	);

	/**
	 * Constructor
	 * @param 	array	$config Accepts the configuration options
	 */
	public function __construct($config = array())
	{
		$this->local_time = time();

		if( count( $config ) > 0 ) {
			$this->config( $config );
		}
	}


	/**
	 * Configuration Setter
	 * @access private
	 * @param	array	$config	The configuration array
	 * @return	void
	 */
	function config( $config = array() )
	{
		foreach ($config as $key => $value) {
			if ( isset( $this->$key ) ) {
				$this->$key = $value;
			}
		}
	}


	/**
	 * Generates the JSON array for Backbone.js use
	 * @param  int $year  year
	 * @param  int $month month
	 * @param  array  $data  events to tie to the calendar
	 * @return JSON        JSON object of the calendar to output
	 */
	public function generate ($year = '', $month = '', $data = array()) {
		// Set and validate the supplied month/year
		if ($year == '')
			$year  = date("Y", $this->local_time);

		if ($month == '')
			$month = date("m", $this->local_time);

		if (strlen($year) == 1)
			$year = '200'.$year;

		if (strlen($year) == 2)
			$year = '20'.$year;

		if (strlen($month) == 1)
			$month = '0'.$month;

		$this->adjust_date($month, $year);

		// Determine days in month
		$days_in_month = $this->get_days_in_month($month, $year);

		// Set days in week to iterate
		if ( isset($this->start_day) )
		{
			$days_of_week = $this->rotate_days_of_week( $this->start_day );
		}

		$first_date	= getdate( mktime(12, 0, 0, $month, 1, $year) );
		$first_day	= $this->start_day + 1 - $first_date['wday'];

		while ( $day > 1 )
		{
			$day -= 7;
		}

		// Set the current month/year/day
		// We use this to determine the "today" date
		$cur_year	= date("Y", $this->local_time);
		$cur_month	= date("m", $this->local_time);
		$cur_day	= date("j", $this->local_time);

		$is_current_month = ($cur_year == $year AND $cur_month == $month) ? TRUE : FALSE;
	}

	/**
	 * Rotates the $this->days_of_week array to allow flexible use
	 * @param  int $start_date currently accepts integer val only
	 * @return array             Rotated version of $this->days_of_week
	 */
	function rotate_days_of_week ( $start_date )
	{
		$days = array();

		while ( count( $days ) != 7 ) {
			$days[] = $this->days_of_week[$start_date % 7];
			$start_date--;
		}

		return $days;
	}

	/**
	 * Corrects month or year that does not fall within the 12 month calendar
	 * @param  int $month month
	 * @param  int $year  year
	 * @return void			Pass by reference updates the values of the month and year variables
	 */
	function adjust_date ( &$month, &$year) {
		while ( $month > 12 ) {
			$year++;
			$month -= 12;
		}
		while ( $month <= 0 ) {
			$year--;
			$month += 12;
		}
	}

	/**
	 * Returns the number of days in the month
	 * @param  int $month number of month
	 * @param  int $year  number of year
	 * @return int $days_in_month
	 */
	function get_days_in_month ($month, $year) {
		$days_per_month = array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

		$days_in_month = $days_in_month[$month];

		if ( $month == 2 )
		{
			if ( $year % 400 == 0 || $year % 100 != 0 && $year % 4 == 0 )
				$days_in_month = 29;
		}

		return $days_in_month;
	}
}