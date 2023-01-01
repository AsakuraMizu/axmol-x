package("robin-map-ax")
    set_base("robin-map")
    add_versions("v1.0.1", "b2ffdb623727cea852a66bddcb7fa6d938538a82b40e48294bb581fe086ef005")
    add_patches("v1.0.1", path.join(os.scriptdir(), "ax.patch"), "dc6b75b000588247bdc1dccc1c8019fa230be47f12f4aadf79483bcadf069152")
