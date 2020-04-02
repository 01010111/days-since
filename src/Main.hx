import haxe.Timer;
import js.Browser;

class Main {

	static var start_date:Date = new Date(2020, 2, 11, 0, 0, 0);
	static var title:String = "Days in Quarantine";

	static var days_since:Int = 0;

	static function main() {
		Browser.document.getElementsByTagName('title')[0].innerText = title;
		var header = Browser.document.createElement('h1');
		header.innerText = title;
		Browser.document.body.appendChild(header);
		calculate_days();
	}

	static function calculate_days() {
		new Timer(1000 * 60 * 15).run = () -> calculate_days();
		var start = start_date.getTime();
		var now = Date.now().getTime();
		var ms = now - start;
		var days = Math.floor(ms / (1000 * 60 * 60 * 24));
		var out = [];
		var fives = 0;
		while (days > 5) {
			out.push('5_${fives % 4}');
			days -= 5;
			fives++;
		}
		out.push('$days');
		if (days_since == days) return;
		days_since = days;
		make_images(out);
	}

	static function make_images(imgs:Array<String>) {
		for (img in Browser.document.getElementsByTagName('img')) img.remove();
		for (img in imgs) {
			var image = Browser.document.createImageElement();
			image.src = 'images/$img.png';
			Browser.document.body.appendChild(image);
		}
	}
	
}
