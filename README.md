# cobnetic

Cobnetic is a POSIX shell-script based static website generator, which operates
on a simple structure of _pages_ and _templates_. It theoretically supports
using any language for templating.

## Operation
Pages are files containing a header with variable metadata, followed by content
in Markdown format. The Markdown content will first be processed by running it
through [Discount][Discount], after which [dtepr][dtepr] is responsible for
inserting the page contents into the template. `dtepr` directives in pages are
fully supported, and will be processed along with the directives in the
template.

See the [example](example/) folder for a very small example site using a single
template, and POSIX shell as the template processor.

## Invocation
Invoke `cobnetic` from a directory containing the site files. With default
behaviour, processing rules (environment variables) will be sourced from
`cobnetic-site.rules` in the site root. Any files ending with `.md.dte` in the
`pages` directory will be processed using templates in the `templates`
directory, and the resulting HTML file will be put in the `site` output
directory.

Default behaviour can be changed by setting one or more of the following
environment variables:

- `CBN_SITERULES`: Path to source the site rules from. (`cotnetic-site.rules`)
- `CBN_OUTPUTPATH`: The directory to put the generated site files in. (`site`)
- `CBN_PAGES`: Directory containing Markdown pages to process. (`pages`)
- `CBN_TEMPLATES`: Directory containing template files. (`templates`)
- `CBN_STATIC`: Directory containing static files. If the directory exists,
  it and its contents will be copied unprocessed to `CBN_OUTPUTPATH`.
  (`static`)
- `CBN_EXT`: Extension of files to process. (`.dte`)

## Language support
- `CBN_PROCESSOR`: Name of a shell function that writes a small executable
  processing program to stdout; this program is responsible for maintaining
  processing state between different `dtepr` invocations (so you can keep
  values in variables throughout the entire page/template). Two such processors
  are currently included; `shell_processor` (the default) and
  `python_processor`. They can be used with your shell and with Python as
  the templating language, respectively.

## Dependencies

[dtepr]: http://martinevald.net/software/dtepr.html
[Discount]: http://www.pell.portland.or.us/~orc/Code/discount/
[Python]: https://python.org/

(Python is currently required for creating the `sender` that communicates with
the `dtepr` processor.)

