import js.html.Element;
import js.html.svg.AElement;

@:expose class Main {

	static var full_nav:DivElement;
	static var small_nav:DivElement;
	static var content:DivElement;
	static var head:DivElement;
	static var body:DivElement;

	static var recipe:Recipe;
	static var page_index:Int = 0;

	static function main() {
		full_nav = cast document.getElementById('full_nav');
		small_nav = cast document.getElementById('small_nav');
		content = cast document.getElementById('content');
		head = cast document.getElementById('head');
		body = cast document.getElementById('body');
		if (window.location.search.length > 0) 'repo/${window.location.search.substr(1)}.md'.fetch(parse_recipe);
		else make_index();
	}

	static function make_index() {
		full_nav.classList.add('index');
		full_nav.innerHTML = '<h1>Cookbook</h1>';
		small_nav.innerHTML = '<h1>Cookbook</h1>';
		set_head_bg('images/index_bg.png');
		'repo/index.md'.fetch(make_contents);
	}

	static function make_contents(index:String) {
		content.clear();
		var div = document.createDivElement();
		div.classList.add('page');
		div.innerHTML = cast new util.Markdown(index);
		content.appendChild(div);
		for (link in div.getElementsByTagName('a')) {
			var href = (cast (cast link:AElement).href:String).split('/').pop();
			(cast link:AElement).removeAttribute('href');
			link.onclick = () -> 'repo/$href.md'.fetch(parse_recipe);
		}
	}

	static function parse_recipe(recipe:String) {
		var pages = recipe.split('---');
		var header = pages.shift().split('\n');
		var recipe:Recipe = { title: header[0], author: header[1], image: header[2], pages: [] }
		for (page in pages) recipe.pages.push(parse_page(page));
		Main.recipe = recipe;
		display_recipe();
	}

	static function parse_page(page:String):RecipePage {
		var out:RecipePage = { title: '', text: '' };
		var lines = page.split('\n');
		for (line in lines) if (line.indexOf('#') == 0) {
			out.title = line.substr(2);
			break;
		}
		while (lines[0].trim().length == 0) lines.shift();
		while (lines[lines.length - 1].trim().length == 0) lines.pop();
		if (out.title.length == 0) out.title = lines[0];
		out.text = lines.join('\n');
		return out;
	}

	static function display_recipe() {
		full_nav.clear();
		small_nav.clear();
		set_nav();
		display_page(0);
	}

	static function set_nav() {
		set_head_bg(recipe.image);

		set_full_nav();
		set_small_nav();
	}

	static function set_full_nav() {
		full_nav.classList.remove('index');

		var content = document.createDivElement();

		var home = document.createImageElement();
		home.src = 'images/icon_home.png';
		home.onclick = () -> make_index();

		var title = document.createElement('h1');
		title.classList.add('no_top_margin');
		title.classList.add('no_bottom_margin');
		title.innerText = recipe.title;

		var author = document.createElement('h3');
		author.classList.add('no_top_margin');
		author.innerText = recipe.author;

		var list = document.createElement('ul');
		for (i in 0...recipe.pages.length) {
			var li = document.createLIElement();
			li.onclick = () -> display_page(i);
			li.innerText = recipe.pages[i].title;
			list.appendChild(li);
		}

		content.appendChild(home);
		content.appendChild(title);
		content.appendChild(author);
		content.appendChild(list);
		full_nav.appendChild(content);
	}

	static function set_small_nav() {
		var home = document.createImageElement();
		var prev = document.createImageElement();
		var next = document.createImageElement();
		prev.classList.add('prev');
		next.classList.add('next');
		home.onclick = () -> make_index();
		prev.onclick = () -> prev_page();
		next.onclick = () -> next_page();
		home.src = 'images/icon_home.png';
		prev.src = 'images/icon_prev.png';
		next.src = 'images/icon_next.png';
		small_nav.appendChild(home);
		small_nav.appendChild(prev);
		small_nav.appendChild(next);
	}

	static function display_page(page:Int) {
		window.scrollTo(0, 0);
		page_index = page;
		// Select nav element
		var list = full_nav.getElementsByTagName('li');
		for (i in 0...list.length) {
			list[i].classList.remove('selected');
		}
		list[page].classList.add('selected');
		// Set content
		content.clear();
		var div = document.createDivElement();
		div.innerHTML = cast new util.Markdown(recipe.pages[page].text);
		div.classList.add('page');
		content.appendChild(div);

		// Nav
		content.appendChild(make_page_nav());
		for (el in document.getElementsByClassName('prev')) page == 0 ? el.classList.add('hide') : el.classList.remove('hide');
		for (el in document.getElementsByClassName('next')) page == recipe.pages.length - 1 ? el.classList.add('hide') : el.classList.remove('hide');
	}

	static function set_head_bg(image:String) {
		if (image.length == 0) return;
		head.style.backgroundImage = 'url(${image})';
	}

	static function prev_page() {
		if (page_index == 0) return;
		display_page(page_index - 1);
	}

	static function next_page() {
		if (page_index == recipe.pages.length - 1) return;
		display_page(page_index + 1);
	}

	static function make_page_nav():Element {
		var out = document.createDivElement();
		out.classList.add('page_nav');

		var prev = document.createImageElement();
		var next = document.createImageElement();
		prev.classList.add('prev');
		next.classList.add('next');
		prev.onclick = () -> prev_page();
		next.onclick = () -> next_page();
		prev.src = 'images/icon_prev.png';
		next.src = 'images/icon_next.png';
		out.appendChild(prev);
		out.appendChild(next);

		return out;
	}

}

typedef Recipe = {
	title:String,
	author:String,
	image:String,
	pages:Array<RecipePage>,
}

typedef RecipePage = {
	title:String,
	text:String,
}