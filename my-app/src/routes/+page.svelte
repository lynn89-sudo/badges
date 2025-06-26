<script>
    import flag from "$lib/assets/orpheus.svg";
    import { onMount } from "svelte";
    //import icon from "$lib/assets/icon.svg";
    let icon = "";
    let icon_load = false;

    let nav_color = "#c7a7a7";

    onMount(() => {
        fetch("https://icons.hackclub.com/api/icons/white/leaders")
        .then(response => response.text())
        .then(svg => {
            icon = svg;
            icon_load = true;
        })
    })

    let name = "Badges";
</script>

<a href = "https://hackclub.com/"><img id="flag" src={flag} alt="orpheus holding a flag with hack club written on it" /></a>
<div id="navbar" style="background-color: {nav_color}">
    <div id="logo" class:loaded={icon_load}>
        {@html icon}
    </div>
</div>