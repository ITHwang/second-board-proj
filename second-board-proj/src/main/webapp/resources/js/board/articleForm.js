var contextPath = "/sbp";

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.readAsDataURL(input.files[0]);
	}
}
function backToList(obj) {
	obj.action = contextPath + "/board/listArticles.do";
	obj.submit();
}

var cnt = 1;
function fn_addFile() {
	$("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
	cnt++;
}  