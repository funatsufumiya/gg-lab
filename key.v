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

fn frame(mut app App) {
	app.gg.begin()
	app.draw()
	app.gg.end()
}

fn (mut app App) draw() {
	mut g := app.gg
	
	if g.is_key_down(gg.KeyCode.space) {
		g.draw_text_def(10, 110, 'space key press')
		g.draw_rect_filled(10, 10, 100, 100, gg.blue)
	}else{
		g.draw_text_def(10, 110, 'space key release')
		g.draw_rect_empty(10, 10, 100, 100, gg.black)
	}
}
