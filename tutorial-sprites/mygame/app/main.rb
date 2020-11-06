def tick args
  # Display ticks
  ticks = args.state.tick_count
  args.outputs.labels << [640, 500, ticks, -5, 0, 200, 050, 100, 125]

  # LABELS                x    y   text                   size al. r    g    b    a   font
  args.outputs.labels << [200, 70, "Label and proud of it", 5, 0, 200, 050, 100, 200, "GeosansLight.ttf"]
  # Alignment: 0 left, 1 center, 2 right
  # LABELS with hash functions, longer to compile
  args.outputs.labels << { x:10, y:500, text:"Hash label" }

  # STATES
  # If click_count doesn't exist, make it equal to 0
  args.state.click_count ||= 0

  if args.inputs.mouse.up
    args.state.click_count += 1
    args.inputs.mouse.up = 0 # Needed so the mouse up does not continue. mouse.down does not need this.
    # We can also use args.inputs.keyboard and args.inputs.controller, then .up, .down, .click, .held
  end

  args.outputs.labels << [50, 700, "Clicks: #{args.state.click_count}", 5, 0, 0, 0, 0, 255, "GeosansLight.ttf"]

  # LINES                x1 y1 x2     y2   r   g    b   a
  args.outputs.lines << [0, 0, 1280, 720, 255, 0, 255, 255]

  # SOLIDS
  board_x = 500
  board_y = 500
  board_w = 100
  board_h = 100
  #                           x         y       w       h      r    g   b a
  args.outputs.borders << [board_x, board_y, board_w, board_h, 0, 255, 0, 255]
  args.outputs.solids << [board_x+1, board_y+1, board_w - 2, board_h - 2, 50, 200, 150, 255]

  # Reset the game each time we change the file
  # $gtk.reset

end
