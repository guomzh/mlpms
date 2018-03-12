function dateToString(date){
	// 年月日
	var month = date.getMonth() + 1;
	var createtime = date.getFullYear();
	if (parseInt(month) < 10) {
		createtime += "-0"+month;
	} else {
		createtime += "-"+month;
	}
	if (parseInt(date.getDate()) < 10) {
		createtime += "-0"+date.getDate();
	} else {
		createtime += "-"+date.getDate();
	}
	
	// 时分秒
	createtime +=" ";
	if (parseInt(date.getHours()) < 10) {
		createtime += "0"+date.getHours();
	} else {
		createtime += ""+date.getHours();
	}
	if (parseInt(date.getMinutes()) < 10) {
		createtime += ":0"+date.getMinutes();
	} else {
		createtime += ":"+date.getMinutes();
	}
	if (parseInt(date.getSeconds()) < 10) {
		createtime += ":0"+date.getSeconds();
	} else {
		createtime += ":"+date.getSeconds();
	}
	return createtime;
}

function dateToString_YMD(date){
	// 年月日
	var month = date.getMonth() + 1;
	var createtime = date.getFullYear();
	if (parseInt(month) < 10) {
		createtime += "-0"+month;
	} else {
		createtime += "-"+month;
	}
	if (parseInt(date.getDate()) < 10) {
		createtime += "-0"+date.getDate();
	} else {
		createtime += "-"+date.getDate();
	}
	return createtime;
}