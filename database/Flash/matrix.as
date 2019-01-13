var new_pages_matrix = all_pages.transform.matrix;
trace("matrix A",new_pages_matrix )
new_pages_matrix.translate(20, 0);
trace("matrix B",new_pages_matrix )
all_pages.transform.matrix = new_pages_matrix; // changes my_mc's position


function getScale(target:DisplayObject):Object{
	var mtx:Matrix = target.transform.matrix;
	return {
		scaleX: mtx.a,
		scaleY: mtx.d
	}
}