# vim-hugo

This is a Vim plugin for web development with the static site generator
[Hugo](https://gohugo.io/).

# HTML

- syntax highlighting and identation is improved to support the HTML Go
  template syntax.
- `:h path` includes default directories used by Hugo, like `layouts/partials`,
  which is convenient to start editing files with `:h gf` and friends.
- `matchit` patterns are extended to support Go template.
- A compiler named `hugo` is added so you can build your site from inside Vim
  with `compiler hugo | make`, and errors will populate the quickfix list.

# Markdown

Markdown syntax highlight is also improved to add support for shortcodes and
YAML front matter.

Embedded languages inside `{{< highlight >}}` shortcode will also be
highlighted, if you configured it properly. For example, to highlight Python
code, add `let g:markdown_fenced_languages=['python']` to your `.vimrc` or
`init.vim`.

```markdown
{{< highlight python >}}
import foo
{{< /highlight >}}
```

Also, to highlight JavaScript code, even if using the `js` shorthand as
identifier, use `let g:markdown_fenced_languages=['js=javascript']`:

```markdown
{{< highlight js >}}
import { bar } from './foo'
{{< /highlight >}}
```

This is reused from Vim's built-in syntax highlight files for markdown, so
it'll also be used for markdown code blocks.
