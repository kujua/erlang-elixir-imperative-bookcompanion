# from https://github.com/elixir-lang/ecto/blob/master/lib/ecto/query.ex
defmacro from(expr, kw \\ []) do
    unless Keyword.keyword?(kw) do
      raise ArgumentError, "second argument to `from` must be a keyword list"
    end

    {quoted, binds, count_bind} = From.build(expr, __CALLER__)
    from(kw, __CALLER__, count_bind, quoted, binds)
  end
