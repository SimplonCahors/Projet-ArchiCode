<?php

/**
 * Services
 */
$settings['container_yamls'] = [$app_root . '/sites/default/services.development.yml'];

/**
 * Show all error messages, with backtrace information.
 */
$config['system.logging']['error_level'] = 'verbose';

/**
 * Disable cache
 */
//$settings['cache']['bins']['page'] = 'cache.backend.null';
//$settings['cache']['bins']['render'] = 'cache.backend.null';
//$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';

/**
 * File system
 */
$settings['extension_discovery_scan_tests'] = FALSE;
//$settings['file_public_base_url'] = 'CDN URL';
$settings['file_public_path'] = 'sites/default/files';
//$settings['file_private_path'] = '../private-files';

/**
 * Disable CSS and JS aggregation.
 */
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

