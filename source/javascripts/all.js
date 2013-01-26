//= require editor
//
Reveal.initialize({
  controls: true,
  progress: true,
  history: true,
  rollingLinks: false,

  theme: Reveal.getQueryHash().theme || 'default', // available themehemes are in /css/theme
  transition: Reveal.getQueryHash().transition || 'concave', // default/cube/page/concave/linear(3d)

  // Optional libraries used to extend on reveal.js
  dependencies: [
    { src: 'javascripts/classList.js', condition: function() { return !document.body.classList; } },
    { src: 'javascripts/notes.js', async: true, condition: function() { return !!document.body.classList; } }

  ]
});
