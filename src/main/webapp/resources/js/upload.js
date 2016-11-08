function checkImageType(fileName) {
	
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
	
}

function getFileInfo(afullName) {
	
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(afullName)) {
		imgsrc = "/displayFile?fileName=" + afullName;
		fileLink = afullName.substr(14);
		
		var front = afullName.substr(0, 12);
		var end = afullName.substr(14);
		
		getLink = "/displayFile?fileName=" + front + end;
		
	} else {
		imgsrc = "/resources/dist/img/file.png";
		fileLink = afullName.substr(12);
		getLink = "/displayFile?fileName=" + afullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, afullName:afullName};
}