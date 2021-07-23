var contextPath = "/sbp";

function backToList(obj) {
	obj.action = contextPath + "/board/listArticles.do";
	obj.submit();
}

function fn_enable() {
	document.getElementById("title").style.display = "none";
	document.getElementById("i_title").setAttribute("type", "text");
	document.getElementById("i_content").readOnly = false;
	document.getElementById("tr_btn_modify").style.display = "table-row";
	document.getElementById("tr_btn").style.display = "none";
	
	if (document.getElementById("i_imageFileName") != null){
		document.getElementById("i_imageFileName").disabled = false;
	}
}

function fn_disable(){
	document.getElementById("title").style.display = "inline";
	document.getElementById("i_title").setAttribute("type", "hidden");
	document.getElementById("i_content").readOnly = true;
	document.getElementById("tr_btn_modify").style.display = "none";
	document.getElementById("tr_btn").style.display = "table-row";
	
	if (document.getElementById("i_imageFileName") != null){
		document.getElementById("i_imageFileName").disabled = true;
	}
}

function fn_modify_article(obj) {
	obj.action = contextPath + "/board/modArticle.do";
	obj.submit();
}

function fn_remove_article(url, articleNO) {
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
	var articleNOInput = document.createElement("input");
	articleNOInput.setAttribute("type", "hidden");
	articleNOInput.setAttribute("name", "articleNO");
	articleNOInput.setAttribute("value", articleNO);

	form.appendChild(articleNOInput);
	document.body.appendChild(form);
	form.submit();

}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
