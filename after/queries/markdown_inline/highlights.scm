; extends
; GitHub-style aside/admonition labels use Xcode's markup.aside.kind color.
((shortcut_link (link_text) @markup.aside)
 (#match? @markup.aside "^!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)$"))
