
// fetch("http://localhost:8080/api/weather/getAll")
// .then(rest => rest.json())
// .then(data => console.log(data))


let myData = [];
function getData() {
	$.ajax({
		url: 'http://localhost:8080/api/weather/getAll',
		dataType: 'json',
		success: function (data) {
			console.log('getData', data);
			showData(data);
		},
	});
}
function showData(data) {
	// console.log(data);
	myData = data.map((d) => {
		return {
			province: d?.province?.name,
			date_weather: d?.date_weather?.full_date,  
			weather_time: d?.weather_time?.hour_time,
            temperature: d?.temperature,
            description: d?.description,
            humidity: d?.humidity,
            vision: d?.vision,
            wind: d?.wind,
            uv_index: d?.uv_index,
            air_quality: d?.air_quality,
		};
	});
	console.log('myData', myData);
	let html='<tr><th>Tỉnh</th><th>Ngày</th><th>Thời gian</th><th>Nhiệt độ</th><th>Mô tả chi tiết</th><th>Độ ẩm</th><th>Tầm nhìn</th><th>Tốc độ gió</th><th>Chỉ số UV</th><th>Chất lượng không khí</th></tr>';
	$.each(myData, function (key, value) {
		html += '<tr>';
		html += '<td>' + value?.province  +  '</td>';
		html += '<td>' + value?.date_weather + '</td>';
		html += '<td>' + value?.weather_time + '</td>';
		html += '<td>' + value?.temperature + " °"+ '</td>';
		html += '<td>' + value?.description + '</td>';
		html += '<td>' + value?.humidity + '</td>';
		html += '<td>' + value?.vision + " km"+'</td>';
		html += '<td>' + value?.wind + " km/giờ"+'</td>';
		html += '<td>' + value?.uv_index + '</td>';
		html += '<td>' + value?.air_quality + '</td>';
		html += '</tr>';
	});
	$('table tbody').html(html);
}
function exportToExcel(fileName, sheetName, table) {
	if (myData.length === 0) {
		console.error('Chưa có data');
		return;
	}
	console.log('exportToExcel', myData);

	let wb;
	if (table && table !== '') {
		wb = XLSX.utils.table_to_book($('#' + table)[0]);
	} else {
		const ws = XLSX.utils.json_to_sheet(myData);
		// console.log('ws', ws);
		wb = XLSX.utils.book_new();
		XLSX.utils.book_append_sheet(wb, ws, sheetName);
	}
	console.log('wb', wb);
	XLSX.writeFile(wb, `${fileName}.xlsx`);
}
