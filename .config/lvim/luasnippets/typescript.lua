return {
  s(
    'clog',
    fmt('console.log({})', {
      i(1)
    })
  ),
  s(
    'ct',
    fmt('console.time({})', {
      i(0)
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
      trig = 'test',
      dscr = 'Create a test',
      priority = 1001
    },
    fmt(
      [[
      test(`{}`, () => {{
        {}
      }}){}
      ]],
      {
        i(1),
        i(2),
        i(0)
      }
    )
  ),
  s(
    {
      trig = 'testeacha',
      dscr = 'Create a test on multiple data with each provided as an array',
      priority = 1001
    },
    fmt(
      [[
      test.each([
        [{}],
      ])('{}', ({}) => {{
        {}
      }}){}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }
    )
  ),
  s(
    {
      trig = 'testeacho',
      dscr = 'Create a test on multiple data with each provided as an object',
      priority = 1001
    },
    fmt(
      [[
      test.each([
        {{ {} }},
      ])('{}', ({{ {} }}) => {{
        {}
      }}){}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }
    )
  ),
  s(
    {
      trig = 'desceachl',
      dscr = 'Test a use case with multiple data provided as arrays',
      priority = 1001
    },
    fmt(
      [[
      describe.each([
        [{}],
      ])('{}', ({}) => {{
          {}
        }}){}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }
    )
  ),
  s(
    {
      trig = 'desceacho',
      dscr = 'Test a use case with multiple data provided as objects',
      priority = 1001
    },
    fmt(
      [[
      describe.each([
        {{ {} }},
      ])('{}', ({{ {} }}) => {{
          {}
        }}){}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0)
      }
    )
  ),
}
