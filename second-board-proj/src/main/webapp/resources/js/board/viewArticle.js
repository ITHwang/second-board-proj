var contextPath = "/sbp";

function backToList(obj) {
	obj.action = contextPath + "/board/listArticles.do";
	obj.submit();
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
		reader.readAsDataURL(input.files[0]);
	}
}
