return {
  -- template snippets
  s(
    {
      trig = 'cm',
      dscr = 'template comment'
    },
    fmt('<!-- {} -->{}', {
      i(1),
      i(0)
    })
  ),
  s(
    'view',
    fmt('<view class="{}">{}</view>{}', {
      i(1),
      i(2),
      i(0)
    })
  ),
  s(
    'block',
    fmt('<block{}>{}</block>{}', {
      i(1),
      i(2),
      i(0)
    })
  ),
  s(
    'slot',
    fmt('<slot name="{}" />{}', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'tag',
      dscr = 'Create an element tag'
    },
    fmt('<{}>{}</{}>', {
      i(1),
      i(0),
      f(
        function (arg)
          local text = arg[1][1]
          local firstWord = string.match(text, "^([%w-]+)")
          return firstWord or ""
        end,
        { 1 }
      )
    })
  ),
  s(
    {
      trig = 'voidt',
      dscr = 'Create a void element tag'
    },
    fmt('<{} />{}', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'wi',
      dscr = 'wxml conditional renderring if'
    },
    fmt('wx:if="{{{{ {} }}}}{}"', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'wei',
      dscr = 'wxml conditional renderring else if'
    },
    fmt('wx:elif="{{{{ {} }}}}{}"', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'we',
      dscr = 'wxml conditional renderring else'
    },
    fmt('wx:else {}"', {
      i(0)
    })
  ),
  s(
    {
      trig = 'ws',
      dscr = 'wxml dynamic style binding'
    },
    fmt('wx:style="{{{{ {} }}}}{}"', {
      i(1),
      i(0)
    })
  ),
  
  -- script snippets
  s(
    'clog',
    fmt('console.log({})', {
      i(1)
    })
  ),
  s(
    {
      trig = 'throwne',
      dscr = 'throw new error'
    },
    fmt('throw new Error({}){}', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'ilaf',
      dscr = 'inline arrow function'
    },
    fmt('{} => {}', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'af',
      dscr = 'arrow function',
      priority = 1001
    },
    fmt('({}) => {{{}}}{}', {
      i(1),
      i(2),
      i(0)
    })
  ),
  s(
    {
      trig = 'cd',
      dscr = 'const statement from destructuring'
    },
    fmt('const {{ {} }} = {}', {
      i(1),
      i(0)
    })
  ),
  s(
    {
      trig = 'cad',
      dscr = 'const statement from array destructuring'
    },
    fmt('const [{}] = {}', {
      i(1),
      i(0)
    })
  ),
}
