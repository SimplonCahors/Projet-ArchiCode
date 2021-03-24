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
 * Mail
 */
$config['swiftmailer.transport']['transport'] = 'smtp';
$config['swiftmailer.transport']['smtp_host'] = 'ssl0.ovh.net';
$config['swiftmailer.transport']['smtp_port'] = '587';
$config['swiftmailer.transport']['smtp_encryption'] = 'tls';
$config['swiftmailer.transport']['smtp_credential_provider'] = 'swiftmailer';
$config['swiftmailer.transport']['smtp_credentials']['swiftmailer']['username'] = 'no-reply@docteur-conso.fr';
$config['swiftmailer.transport']['smtp_credentials']['swiftmailer']['password'] = "!.XMvT*3s%@'";


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
