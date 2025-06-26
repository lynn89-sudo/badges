<script>
    export let data;
    
    import flag from "$lib/assets/orpheus.svg";
    import { onMount } from "svelte";
    //import icon from "$lib/assets/icon.svg";
    let icon = "";
    let icon_load = false;
    let title_load = false;
    let loadALL = false;

    let nav_color = "#c7a7a7";

    onMount(() => {
        fetch("https://icons.hackclub.com/api/icons/white/leaders")
        .then(response => response.text())
        .then(svg => {
            icon = svg;
            icon_load = true;
            setTimeout(function() {
                title_load = true;
            }, 1000);
            setTimeout(function() {
                loadALL = true;}, 1800);
            })
    })
</script>

<a href = "https://hackclub.com/"><img id="flag" src={flag} alt="orpheus holding a flag with hack club written on it" /></a>
<div id="navbar" style="background-color: {nav_color}">
    <div id="logo" class:loaded={icon_load}>
        {@html icon}
    </div>
</div>
<div id="spacing"></div>
    <h1 id="animated-text" class:loaded={title_load}>
        <span>b</span><span>a</span><span>d</span><span>g</span><span>e</span><span>s</span>
    </h1>
    <div id= "bodycontent" class:load={loadALL}>
        <h2 class="rotate"><span>Celebrating and recognizing the achievements of Hack Clubs and their members</span></h2>
    <br>

    {#if data.clubs.length > 0}
    <ul>
        {#each data.clubs as club}
            
        {/each}
    </ul>
    {:else}
    <p>No clubs found.</p>
    {/if}
</div>
