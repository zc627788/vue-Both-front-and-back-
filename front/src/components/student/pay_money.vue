<template>
  <div class="section">
    <el-row class="layout-center">
      <el-col :sm="12" :lg="6">
        <el-result :icon="result.status" :title="result.message">
          <template slot="extra">
            <el-button type="primary" size="medium" @click="close"
              >关闭页面</el-button
            >
          </template>
        </el-result>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      result: { message: "充值中", status: "info" }
    };
  },
  mounted() {
    function queryParams(val) {
      const w = location.hash.indexOf("?");
      const query = location.hash.substring(w + 1);

      const vars = query.split("&");
      for (let i = 0; i < vars.length; i++) {
        const pair = vars[i].split("=");
        if (pair[0] == val) {
          return pair[1];
        }
      }
    }

    this.$http
      .post("http://192.168.10.106:3000/student/payMoney", {
        username: queryParams("username"),
        money: queryParams("money")
      })
      .then(data => {
        console.log(data);
        this.result.message = "充值成功";
        this.result.status = "success";
      })
      .catch(data => {
        this.result.message = "充值失败";
        this.result.status = "error";
      });
  },
  methods: {
    close() {
      window.close();
    }
  }
};
</script>

<style scoped>
.layout-center {
  display: flex;
  justify-content: center;
}
</style>
