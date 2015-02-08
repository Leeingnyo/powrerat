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
	num = 1;

	$('.blue').click(function() {
		usage_all()
	});
	$('.red').click(function() {
		active_all()
	});
	$('.green').click(function() {
		if (num > 5) num = 1;
		num++;
		get_pikachu_info_(num);
	});
	$('.yellow').click(function() {
	//	new deadPika(that);
		active_appliances_all()
	});

	$('#pikachu').click(function() {
		$('audio')[pika_status].play()
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

