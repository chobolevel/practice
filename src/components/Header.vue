<template>
  <header>
    <h1>
      <router-link to="/">ToDo List</router-link>
    </h1>
    <p class="date">{{ date }}</p>
    <div class="weather">
      {{ text }}
    </div>
  </header>
</template>

<script>
  import Vue from 'vue'
  import VueGeolocationApi from 'vue-geolocation-api'
  import axios from "axios";

  const API_KEY = "2cfec1e7f84a61a59378e73f3b80c283";

  Vue.use(VueGeolocationApi);

  export default {
      data() {
        return {
          date: new Date().getFullYear() + "년 " +  (new Date().getMonth() + 1) + "월 " + new Date().getDate() + "일 " + new Date().toLocaleTimeString(),
          latitude: '',
          longitude: '',
          text: '',
        }
      },
      created() {
        //현재 좌표 받아오는 부분
        if(!("geolocation" in navigator)) {
          this.text = 'Geolocation is not available.';
          return;
        }
        this.text = 'Loading...'
        navigator.geolocation.getCurrentPosition(pos => {
          this.latitude = pos.coords.latitude;
          this.longitude = pos.coords.longitude;
          //좌표 기반 날씨 API 호출
          const params = { lat: this.latitude, lon: this.longitude, appid: API_KEY, units: "metric"}
          axios.get(`https://api.openweathermap.org/data/2.5/weather`, { params })
            .then(response => {
              this.text = response.data.name + ", " + response.data.weather[0].main
            });
        }, err => {
          this.text = err.message;
        })
        //현재 시각 인터벌
        setInterval(() => {
          const newDate = new Date();
          this.date = newDate.getFullYear() + "년 " + (newDate.getMonth() + 1) + "월 " + newDate.getDate() + "일 " + newDate.toLocaleTimeString()
        }, 1000);
      }
    }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css?family=Gugi:400');
  header {
    width: 100%;
    padding: 30px 20px;
    position: relative;
  }
  h1 > a{
    font-size: 40px;
    font-family: Gugi;
    color: tomato;
  }
  .date {
    position: absolute;
    top: 10px;
    right: 10px;
    font-family: arial;
  }
  .weather {
    position: absolute;
    bottom: 10px;
    right: 10px;
    font-family: arial;
  }
</style>
