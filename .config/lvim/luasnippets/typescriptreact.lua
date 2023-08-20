return {
  s(
    {
      trig = 'us',
      dscr = 'Customized useState snippet. The set function will be auto named in camelcase according to the state name.',
    },
    fmt('const [{}, {}] = useState({})', {
      i(1),
      f(
        function (args)
          local statename = args[1][1]
          return 'set' .. statename:gsub('^%l', string.upper)
        end,
        { 1 }
      ),
      i(0)
    })
  ),
  s(
    'ur',
    fmt('const {} = useRef({})', {
      i(1),
      i(2, 'null')
    })
  ),
  s(
    {
      trig = 'rtjsx',
      dscr = 'Return a jsx block'
    },
    fmt(
      [[
      return (
        <{}>{}</{}>
      ){}
      ]],
      {
        i(1),
        i(2),
        rep(1),
        i(0)
      }
    )
  ),
  s(
    {
      trig = 'tag',
      dscr = 'Create a element tag'
    },
    fmt('<{}>{}</{}>{}', {
      i(1),
      i(2),
      rep(1),
      i(0)
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
      trig = 'ilaf',
      dscr = 'inline arrow function'
    },
    fmt('({}) => {}', {
      i(1),
      i(0)
    })
  ),
}
