import gg
import math.vec
import sokol.sgl

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
	r := app.gg.mouse_pos_x
	sgl.translate(100, 100, 0)
	sgl.rotate(sgl.rad(r), 0, 0, 1)
	app.gg.draw_text_def(0, 0, 'hello world!')
}
