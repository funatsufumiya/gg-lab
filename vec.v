import gg
import math.vec

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

fn frame(mut app App) {
	app.gg.begin()
	app.draw()
	app.gg.end()
}

fn (mut app App) draw() {
	p := vec.vec2(app.gg.mouse_pos_x, app.gg.mouse_pos_y)
	app.gg.draw_text_def(p.x, p.y, 'hello world!')
}
