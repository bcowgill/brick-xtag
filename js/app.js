// app.js

// make a flipbox handler function which changes the flip direction after
// it returns to the front facing side.
function makeFlipHandler(delay)
{
	var timer = undefined, Directions = ["right", "up", "left", "down"];
	delay = delay || 500;
	return function ()
	{
		var self = this, flipped = self.hasAttribute('flipped');
		if (flipped && !timer)
		{
			timer = setInterval(function () {
				var idx = Directions.indexOf(self.getAttribute('direction'));
				clearInterval(timer);
				timer = undefined;
				if (++idx >= Directions.length)
				{
					idx = 0;
				}
				self.setAttribute("direction", Directions[idx]);
			}, delay);
		}
		self.toggle();
	};
}

function activateFlipButtons(flipBox)
{
	var buttons = xtag.query(flipBox, 'button.flip');
	fnFlip = makeFlipHandler().bind(flipBox);

	buttons.forEach(function (element)
	{
		element.addEventListener("click", fnFlip);
	});
}

/* When components are ready, activate them */
document.addEventListener('DOMComponentsLoaded', function(){
	activateFlipButtons(document.getElementById("map-flipbox"));
});
