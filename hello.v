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
		window_title:  'Hello'
		frame_fn:      frame
		user_data:     app
	)
	app.gg.run()
}

fn frame(mut app App) {
	app.gg.begin()
	app.draw()
	app.gg.end()
}

fn (mut app App) draw() {
	g := app.gg
	g.draw_text_def(10, 10, 'hello world!')
	g.draw_rect_filled(30, 30, 40, 40, gg.blue)
	g.draw_rect_empty(25, 25, 50, 50, gg.black)
}
