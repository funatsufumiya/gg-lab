import gg
import gg.m4
import math.vec

const win_width = 600
const win_height = 300

struct App {
mut:
	gg    &gg.Context = unsafe { nil }
	mat   m4.Mat4
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

fn to_vec4(p vec.Vec2[f32]) m4.Vec4 {
	return m4.Vec4{[f32(p.x), f32(p.y), f32(0.0), f32(1.0)]!}
}

fn to_vec2f(m m4.Vec4) vec.Vec2[f32] {
	return vec.vec2(m.e[0], m.e[1])
}

fn to_vec2i(m m4.Vec4) vec.Vec2[int] {
	return vec.vec2(int(m.e[0]), int(m.e[1]))
}

fn vec2f(x int, y int) vec.Vec2[f32] {
	return vec.vec2(f32(x), f32(y))
}

// // Get a matrix translated by a vector w
// fn (x Mat4) translate(w Vec4) Mat4 {
// 	// vfmt off
// 	return unsafe { 
// 		Mat4{ e: [
// 			x.e[0],             x.e[1],             x.e[2 ],            x.e[3 ],
// 			x.e[4],             x.e[5],             x.e[6 ],            x.e[7 ],
// 			x.e[8],             x.e[9],             x.e[10],            x.e[11],
// 			x.e[12] + w.e[0],   x.e[13] + w.e[1],   x.e[14] + w.e[2],   x.e[15],
// 		]!}
// 	}
// 	// vfmt on
// }

fn (mut app App) draw() {
	p0 := vec2f(0, 0)
	p := vec2f(app.gg.mouse_pos_x, app.gg.mouse_pos_y)

	app.mat = m4.unit_m4()
	app.mat = app.mat.translate(to_vec4(p))

	// println(app.mat)
	// println("----")

	// println(to_vec4(p0))
	// println("----")

	v := m4.mul_vec(app.mat.transpose(), to_vec4(p0))
	p2 := to_vec2i(v)

	// println(v)
	// println("----")

	app.gg.draw_text_def(p2.x, p2.y, 'hello world!')
}
