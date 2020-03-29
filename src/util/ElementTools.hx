package util;

import js.html.Element;

class ElementTools {
    public static function clear(e:Element) {
        for (child in e.children) child.remove();
        e.innerHTML = '';
    }
}