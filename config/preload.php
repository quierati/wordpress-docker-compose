<?php

declare(strict_types=1);

$preload_patterns = [
    "*.php",
    "wp-includes/**/*.php",
    "wp-includes/*.php",
];

$exclusions = [];

foreach ($preload_patterns as $pattern) {
    $files = glob($pattern);

    foreach ($files as $file) {
	if (in_array($file, $exclusions, true)) continue;
        opcache_compile_file($file);
    }
}
