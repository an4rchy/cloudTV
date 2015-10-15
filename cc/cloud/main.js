
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success(request.params);
});

Parse.Cloud.define("youtube", function(request,response) {

var url = "https://www.googleapis.com/youtube/v3/videos?id=" + request.params["url"] + "&key=AIzaSyD3-c7c6n0TkmbNpDl1sVDMWb3Cbr1MSpw&part=id,snippet,contentDetails,statistics,status"
Parse.Cloud.httpRequest({ url: url }).then(
	function(resp) {
		var Data = Parse.Object.extend("data")
		var tempObj = new Data()
		var items = resp.data.items
		// response.success(items)
		if (items.length != 0){ 
			tempObj.set("name", items[0]["snippet"]["title"])
  	tempObj.set("desc", items[0]["snippet"]["description"])
  	tempObj.set("cat",1)
  	tempObj.set("url", items[0]["id"])
  	tempObj.save(null, {
  		success: function(saved) {
  			response.success("Successfully saved")
  		},
  		error: function(error) {
  			response.success("Wasnt able to save")
  		}
  	})
		}
	else {
			response.success("No data")

	}

	},
	function(resp) {
		console.log("Something went wrong!")
		response.error("something went wrong")
	});


})

