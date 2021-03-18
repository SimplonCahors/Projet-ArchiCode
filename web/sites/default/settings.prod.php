<?php

/**
 * File system
 */
$settings['file_public_path'] = 'sites/default/files';
//$settings['file_private_path'] = '../private-files';

/**
 * Enable CSS and JS aggregation.
 */
$config['system.performance']['css']['preprocess'] = TRUE;
$config['system.performance']['js']['preprocess'] = TRUE;
$config['system.performance']['cache']['page']['max_age'] = 86400;

/**
 * Disable automated cron
 */
$config['automated_cron.settings']['interval'] = 0;

/**
 * Trusted hosts
 */
$settings['trusted_host_patterns'] = [
  '^www\.cplus2b-architecture\.fr$',
  '^cplus2b-architecture\.fr$'
];