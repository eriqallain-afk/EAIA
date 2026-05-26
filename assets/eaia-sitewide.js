(function(){
  var inPages=location.pathname.indexOf('/pages/')!==-1;
  var root=inPages?'../':'';
  var brand=document.querySelector('nav .nav-brand');
  if(brand){
    brand.href=root+'index.html';
    brand.innerHTML='<div class="nav-logo-text"><span class="ea">EA</span><span class="sep"> | </span><span class="ia">IA</span></div><div class="nav-tagline">Intelligence artificielle opérationnelle</div>';
  }
  var cta=document.querySelector('nav .nav-cta');
  if(cta){cta.textContent='Démo';}
  var css='nav .nav-brand{display:flex!important;flex-direction:column!important;align-items:flex-start!important;gap:2px!important;text-decoration:none!important}nav .nav-logo-text{font-family:\'Cormorant Garamond\',serif!important;font-size:22px!important;font-weight:600!important;letter-spacing:4px!important;line-height:1!important;white-space:nowrap!important}nav .nav-logo-text .ea{color:var(--gold,#c8952a)!important}nav .nav-logo-text .sep{color:rgba(200,149,42,.5)!important;margin:0 2px!important}nav .nav-logo-text .ia{color:var(--silver-light,#d8dce8)!important}nav .nav-tagline{display:block!important;font-family:\'JetBrains Mono\',monospace!important;font-size:7px!important;color:rgba(200,149,42,.58)!important;letter-spacing:3px!important;text-transform:uppercase!important;white-space:nowrap!important;line-height:1!important}nav .nav-cta{padding:8px 15px!important;font-size:9px!important;letter-spacing:1.2px!important;line-height:1!important;width:auto!important;min-width:0!important;max-width:max-content!important;white-space:nowrap!important;overflow:hidden!important;text-align:center!important}.hero{position:relative!important;overflow:hidden!important}.hero:before{content:""!important;position:absolute!important;inset:0!important;background-image:linear-gradient(90deg,rgba(0,0,0,.90),rgba(0,0,0,.72),rgba(0,0,0,.46)),var(--eaia-random-bg,none)!important;background-size:cover!important;background-position:center!important;background-repeat:no-repeat!important;z-index:0!important;pointer-events:none!important}.hero>*{position:relative!important;z-index:1!important}@media(max-width:720px){nav{padding:12px!important;gap:8px!important}nav .nav-logo-text{font-size:18px!important;letter-spacing:3px!important}nav .nav-tagline{font-size:5.8px!important;letter-spacing:1.15px!important;max-width:185px!important;overflow:hidden!important;text-overflow:ellipsis!important}nav .nav-cta{padding:5px 7px!important;font-size:7px!important;letter-spacing:.55px!important;max-width:58px!important;display:inline-flex!important;align-items:center!important;justify-content:center!important;flex:0 0 auto!important}}';
  var s=document.createElement('style');s.textContent=css;document.head.appendChild(s);
  var imgs=['1.png','2.png','3.png','4.png','5.png','6.png','7.png','8.png','9.png'];
  var pick=imgs[Math.floor(Math.random()*imgs.length)];
  document.documentElement.style.setProperty('--eaia-random-bg','url("'+root+'assets/factory-bg/'+pick+'")');
})();
