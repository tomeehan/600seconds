# 600 Seconds

600 seconds keeps me focused. 

Every 10 minutes (or 600 seconds) the app seconds a push notification (+ sound) reminding the user to stay on task.


#### To-do’s (for this app)

- Allow user to edit countdown time.
- Fix ‘default name’ bug.

#### Screenshot

<img src="https://github.com/tomeehan/600seconds/blob/master/screen.gif?raw=true" width=“100”>



#### Background

To stop me getting distracted, I used to paste in a countdown timer JavaScript into the Chrome console with an alert reminding me to stay focused.

###### Bonus: 
Here’s the script: 

	var i = 5;
	
	function startTimer() {
	
		var countdownTimer = setInterval(function() {
	
			console.log(i);
			i = i - 1;
	
			if (i <= 0) {
	            
				clearInterval(countdownTimer);
				window.alert(“Stay focused Tom!”);
			}

		}, 1000);
	
	}
	
	startTimer(); 