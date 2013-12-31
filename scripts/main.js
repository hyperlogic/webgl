require(["scripts/three.min.js"], function () {

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    var geometry = new THREE.CubeGeometry(1, 1, 1);
    //var geometry = new THREE.SphereGeometry(1, 100, 100);

	var checkerTexture = new THREE.ImageUtils.loadTexture('images/checkerboard.jpg');
    var specularTexture = new THREE.ImageUtils.loadTexture('images/holographic-foil2.png');

    var uniforms = {
        diffuseMap: {type: "t", value: checkerTexture},
        specularMap: {type: "t", value: specularTexture},
        color: {type: "c", value: new THREE.Color(0x2020ff)},
        ambientColor: {type: "c", value: new THREE.Color(0x101010)},
        directionalLightColor: {type: "c", value: new THREE.Color(0xffffff)},
        directionalLightDirection: {type: "v3", value: (new THREE.Vector3(0.1, 0.7, 0.5)).normalize()}
    };
    var material = new THREE.ShaderMaterial({
        uniforms: uniforms,
        vertexShader: document.getElementById('shaders/holo_foil.vsh').textContent,
        fragmentShader: document.getElementById('shaders/holo_foil.fsh').textContent,
        maxDirLights: 1
    });

    var cube = new THREE.Mesh(geometry, material);
    scene.add(cube);
    camera.position.z = 3;

    var directionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
    directionalLight.position.set(0.1, 1, 0.1);
    scene.add(directionalLight);

    function render() {
        requestAnimationFrame(render);
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;
        renderer.render(scene, camera);
    }
    render();
});