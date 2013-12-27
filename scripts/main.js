require(["scripts/three.min.js"], function () {

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

    var renderer = new THREE.WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    document.body.appendChild( renderer.domElement );

    var geometry = new THREE.CubeGeometry(1,1,1);
    var uniforms = {
        color: { type: "c", value: new THREE.Color( 0x0000ff ) },
    };
    var material = new THREE.ShaderMaterial({
        uniforms: uniforms,
        vertexShader: document.getElementById('shaders/lit.vsh').textContent,
        fragmentShader: document.getElementById('shaders/lit.fsh').textContent
    });

    var cube = new THREE.Mesh( geometry, material );
    scene.add( cube );
    camera.position.z = 3;

    function render() {
        requestAnimationFrame(render);
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;
        renderer.render(scene, camera);
    }
    render();
});