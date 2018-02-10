# Making Contributions

## Style

Please make sure that any contribution mostly conforms to
[Google's Vimscript Style Guide].

Specifically, if [vint] doesn't like it, it should be changed (you can easily
use [vint] with the [ale] vim plugin).

Some specifics that are worth mentioning (many of which are part of the Google
Style guide) are that there should be:
* No trailing white space
* Indents made with 2 space characters
* No spacing made with tab characters (which especially includes spacing made
  with a combination of tab and space characters)
* No line exceeding 80 columns
* Strings should be enclosed with single quotes unless double quotes is needed
  (for example, double quotes are needed for escaped characters)
* All variables should have a scope prefix
* All string comparisons should specify a suffix of `?` or `#` to specify if the
  case matters (without those suffixes, it will use the user's case settings
  which we probably don't want)


[Google's Vimscript Style Guide]: https://google.github.io/styleguide/vimscriptguide.xml
[vint]: https://github.com/Kuniwak/vint
[ale]: https://github.com/w0rp/ale
