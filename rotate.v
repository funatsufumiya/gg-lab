import gg
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
		window_title:  'Rotate'
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
	g:= app.gg
	r := g.mouse_pos_x
	sgl.translate(200, 200, 0)
	sgl.rotate(sgl.rad(r), 0, 0, 1)
	g.draw_text_def(0, 0, 'hello world!')
}
