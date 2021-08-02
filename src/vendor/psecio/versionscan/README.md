versionscan
===========

[![Build Status](https://secure.travis-ci.org/psecio/versionscan.png?branch=master)](http://travis-ci.org/psecio/versionscan)
[![Total Downloads](https://img.shields.io/packagist/dt/psecio/versionscan.svg?style=flat-square)](https://packagist.org/packages/psecio/versionscan)

Versionscan is a tool for evaluating your currently installed PHP version
and checking it against known CVEs and the versions they were fixed in
to report back potential issues.

**PLEASE NOTE:** Work is still in progress to adapt the tool to linux distributions that backport security fixes. As of right now, this only reports back for the straight up version reported.

Installation
------------

### Using Composer

```
{
    "require": {
        "psecio/versionscan": "dev-master"
    }
}
```

The only current dependency is the Symfony console.

Usage
------------

To run the scan against your current PHP version, use:

`bin/versionscan`

The script will check the `PHP_VERSION` for the current instance and
generate the pass/fail results. The output looks similar to:

```
Executing against version: 5.4.24
+--------+---------------+------+------------------------------------------------------------------------------------------------------+
| Status | CVE ID        | Risk | Summary                                                                                              |
+--------+---------------+------+------------------------------------------------------------------------------------------------------+
| FAIL   | CVE-2014-3597 | 6.8  | Multiple buffer overflows in the php_parserr function in ext/standard/dns.c in PHP before 5.4.32 ... |
| FAIL   | CVE-2014-3587 | 4.3  | Integer overflow in the cdf_read_property_info function in cdf.c in file through 5.19, as used in... |
```

Results will be reported back colorized as well to easily show the pass/fail
of the check.

Parameters
------------

There are several parameters that can be given to the tool to configure its scans and results:

### PHP Version

If you'd like to define a PHP version to check other than the one the script finds itself, you can use the `php-version` parameter:

```
bin/versionscan scan --php-version=4.3.2
```

### Report Only Failures

You can also tell the versionscan to only report back the failures and not the passing tests:

```
bin/versionscan scan --fail-only
```

### Sorting results

You can also sort the results either by the CVE ID or by severity (risk rating), with the `sort` parameter
and either the "cve" or "risk" value:

```
bin/versionscan scan --sort=risk
```

### Output formats

By default *versionscan* will output information directly to the console in a human-readable result. You can also specify other output formats that may be easier to parse programatically (like JSON). Use the `--format` option to change the output:

```
vendor/bin/versionscan scan --php-version=5.5 --format=json
```

Supported output formats are `console`, `json`, `xml` and `html`.

The HTML output format requires an `--output` option of the directory to write the file:

```
vendor/bin/versionscan scan --php-version=5.5 --format=html --output=/var/www/output
```

The result will be written to a file named something like `versionscan-output-20150808.html`
