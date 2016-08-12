{:ok, pid} = Gutenex.start_link
  |> Gutenex.set_page(1)
  |> Gutenex.begin_text
  |> Gutenex.set_font("Helvetica", 48)
  |> Gutenex.text_position(40, 180)
  |> Gutenex.text_render_mode(:fill)
  |> Gutenex.write_text("ABC")
  |> Gutenex.set_font("Courier", 32)
  |> Gutenex.text_render_mode(:stroke)
  |> Gutenex.write_text("xyz")
  |> Gutenex.end_text
  |> Gutenex.move_to(400, 20)
bin = Gutenex.export(pid)
Gutenex.stop
