var PowerRatManager = function() {
	this.top = $('.top');
	this.side = $('.side');
	this.info = $('.info');
	this.deadCount = 0;

	this._initialize();
}

var _ = PowerRatManager.prototype;

_._initialize = function() {
	this._bindEvents();
}

_._bindEvents = function() {
	var that = this;

	$('.blue').click(function() {
		$('#pikachu')[0].src = '/assets/pika1.gif';
		$('#pikachu')[0].style.top = '120px';
		usage_all()
	});
	$('.red').click(function() {
		$('#pikachu')[0].src = '/assets/pika2.gif';
		$('#pikachu')[0].style.top = '120px';
		active_all()
	});
	$('.green').click(function() {
		$('#pikachu')[0].src = 'assets/pika3.gif';
		$('#pikachu')[0].style.top = '160px';
	});
	$('.yellow').click(function() {
	//	new deadPika(that);
		active_appliances_all()
	});
}

_.deadPika = function(that) {
	this.dom = document.createElement("img");
	this.dom.className = "deadPika";
	this.dom.src = '/assets/pika3_web.gif';
	this.dom.style.width = '200px';
	this.dom.style.position = 'absolute';
	this.dom.style.left = 10 + (that.deadCount * 20) + 'px';
	this.dom.style.top = '10px'

	$('.gameView')[0].appendChild(this.dom);
	that.deadCount++;
}

