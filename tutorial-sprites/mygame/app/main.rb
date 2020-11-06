def tick args
  # Display a sprite
  SIZE = 100                
  #                         x    y    w     h       path                  angle  A     R    G   B
  args.outputs.sprites << [20 , 20, SIZE, SIZE, 'sprites/circle-indigo.png', 0, 255, 255, 255, 255]

  # Hash sprite function
  args.outputs.sprites << {
    x: 200, y:400, w:100, h:100, path:'sprites/dragon-0.png', angle:45, a:255, r:255, g:255, b:255,
    source_x: 5, source_y: 5, source_w: -2, source_h: -2,
    flip_horizontally: true, flip_vertically:false,
    angle_anchor_x:0.5, angle_anchor_y:1.0
  }

  #$gtk.reset

  # State variables
  # - Init values
  args.state.sprite_x ||= 10
  args.state.sprite_y ||= 10
  args.state.sprite_size ||= 32
  # - Display
  args.outputs.sprites << [args.state.sprite_x , args.state.sprite_y, args.state.sprite_size, args.state.sprite_size, 'sprites/circle-red.png', 45, 255, 255, 255, 255]
  # - Change values (accelerating)
  args.state.sprite_x = (args.state.sprite_x + args.state.tick_count / 1000) % 1280
  args.state.sprite_y = (args.state.sprite_y + args.state.tick_count / 1000) % 720

  # Movement
  # - Init
  args.state.hero_x ||= 500
  args.state.hero_y ||= 500
  args.state.hero_size ||= 64
  args.state.hero_move_speed ||= 5
  args.state.hero_direction ||= 0

  args.outputs.sprites << [args.state.hero_x , args.state.hero_y, args.state.hero_size, args.state.hero_size, 'sprites/hexagon-blue.png', args.state.hero_direction, 255, 255, 255, 255]
  # - Movement
  if args.inputs.keyboard.d
    args.state.hero_x = args.state.hero_x + args.state.hero_move_speed
    args.state.hero_direction = 0
  end
  if args.inputs.keyboard.q
    args.state.hero_x = args.state.hero_x - args.state.hero_move_speed
    args.state.hero_direction = 180
  end
  if args.inputs.keyboard.z
    args.state.hero_y = args.state.hero_y + args.state.hero_move_speed 
    args.state.hero_direction = 90
  end
  if args.inputs.keyboard.s
    args.state.hero_y = args.state.hero_y - args.state.hero_move_speed
    args.state.hero_direction = 270
  end
  # Boundaries
  if args.state.hero_x < 0
    args.state.hero_x = 0
  elsif args.state.hero_x > 1280 - args.state.hero_size
    args.state.hero_x = 1280 - args.state.hero_size
  elsif args.state.hero_y < 0
    args.state.hero_y = 0
  elsif args.state.hero_y > 720 - args.state.hero_size
    args.state.hero_y = 720 - args.state.hero_size
  end

end
