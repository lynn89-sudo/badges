<script>
    import flag from "$lib/assets/orpheus.svg";
    import { onMount } from "svelte";
    //import icon from "$lib/assets/icon.svg";
    let icon = "";
    let icon_load = false;
    let title_load = false;
    let loadALL = false;

    let nav_color = "#c7a7a7";

    function installSlack() {
        window.location.href = "/slack/start";
    }

    onMount(() => {
        fetch("https://icons.hackclub.com/api/icons/white/leaders")
        .then(response => response.text())
        .then(svg => {
            if (icon === "") {icon = svg;}
            icon_load = true;
            setTimeout(function() {
                title_load = true;
            }, 1000);
            setTimeout(function() {
                loadALL = true;}, 1800);
            })
    })

    let filter = "";
    let clubList = "";

    /*
    if (data.clubs.length > 0) {
        for (let i = 0; i < data.clubs.length; i++) {
            let club = data.clubs[i];
            if (club.name.toLowerCase().includes(filter.toLowerCase())) {
                clubList += `<li><a href="${club.url}">${club.name}</a></li>`;
            }
        }
    }
    */

    /*
    {#if data.clubs.length > 0}
    <ul>
        {#each data.clubs as club}
            
        {/each}
    </ul>
    {:else}
    <p>No clubs found.</p>
    {/if}
    */
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
        <div>
            <div><input placeholder = "Search Clubs..." id="searchbar" class="searchbar"/><button id="searchbutton" class="searchbutton"><span class="material-symbols-outlined">search</span></button></div>
        </div>
        <br><br><br>
        <div id="signin">
            <button onclick = "{ installSlack }"><span class="material-symbols-outlined">account_circle</span> Login</button>
        </div>
    </div>