<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>好书好评</span>
    </div>
    <el-row :gutter="20">
      <el-col :span="6" v-for="item in books" :key="item">
        <img :src="item.imgPath" alt class="img" />
        <div>
          <h4 href>{{item.Book_name}}</h4>
          <div class="autor">{{item.Writer}}</div>
        </div>
      </el-col>
    </el-row>
  </el-card>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";
import moment from "moment";
export default {
  name: "bookRecommend",
  computed: {
    ...mapGetters(["books"])
  },
  data() {
    return {
      keywords: "",
      pageSize: 4,
      currentPage: 1
    };
  },
  created() {
    this.findRecommend();
  },
  methods: {
    //日期显示问题
    dateFormat(row, column) {
      var date = row[column.property];
      if (date == undefined) {
        return "";
      }
      return moment(date).format("YYYY-MM");
    },
    handleCurrentChange: function(currentPage) {
      this.currentPage = currentPage;
    },
    //模糊查询
    findQuery() {
      var params = { keys: this.keywords };
      this.findQueryBook(params);
    },

    ...mapActions(["findRecommend", "findQueryBook"])
  }
};
</script>


<style>
a {
  text-decoration: none;
  color: #3377aa;
}
.pageMiddle {
  position: relative;
  left: 50%;
  top: 40px;
  transform: translateX(-10%);
}
.img {
  display: block;
  width: 230px;
  height: 258px;
  align-self: flex-end;
  border: 1px solid #ccc;
}
.autor {
  color: #333;
  width: 102px;
  font-size: 13px;
  margin-bottom: 6px;
}
.flex {
  display: flex;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}

.box-card {
  width: 100vm;
  height: 450px;
}
</style>