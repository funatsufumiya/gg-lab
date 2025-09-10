import gg

const win_width = 600
const win_height = 300

struct App {
mut:
	gg    &gg.Context = unsafe { nil }
}

fn main() {
	mut app := &App{}
	app.gg = gg.new_context(
		bg_color:      gg.white
		width:         win_width
		height:        win_height
		create_window: true
		window_title:  'Rectangles'
		frame_fn:      frame
		user_data:     app
	)
	app.gg.run()
}

fn frame(app &App) {
	app.gg.begin()
	app.draw()
	app.gg.end()
}

fn (app &App) draw() {
	x := app.gg.mouse_pos_x
	y := app.gg.mouse_pos_y

	app.gg.draw_text_def(x - 10,y - 20, 'hello world!')
	app.gg.draw_rect_filled(x + 10, y + 10, 40, 40, gg.blue)
	app.gg.draw_rect_empty(x + 5, y + 5, 50, 50, gg.black)
}
