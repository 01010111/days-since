import haxe.Timer;
import js.Browser;

class Main {

	static var title:String = "Days in Quarantine";
	static var start_date:Date = new Date(2020, 2, 11, 0, 0, 0);
	static var end_date:Date;

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
		var end = Date.now().getTime();
		if (end_date != null && end_date.getTime() < end) end = end_date.getTime();
		var ms = end - start;
		var days = Math.floor(ms / (1000 * 60 * 60 * 24));
		if (days_since == days) return;
		days_since = days;
		var out = [];
		var fives = 0;
		for (i in 0...Math.floor(days/5)) out.push('images/5_${fives++ % 4}.png');
		out.push('images/${days % 5}.png');
		make_images(out);
	}

	static function make_images(imgs:Array<String>) {
		for (img in Browser.document.getElementsByTagName('img')) img.remove();
		for (img in imgs) {
			var image = Browser.document.createImageElement();
			image.src = img;
			Browser.document.body.appendChild(image);
		}
	}
	
}
