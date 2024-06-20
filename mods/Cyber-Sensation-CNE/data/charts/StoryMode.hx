function create() {
    addVirtualPad('NONE', 'A');
	addVirtualPadCamera();
}
function update() {
    if(controls.ACCEPT) {
    addVirtualPad('NONE', 'A_B_X_Y');
	addVirtualPadCamera();
	}
}