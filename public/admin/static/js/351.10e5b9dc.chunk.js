"use strict";(self.webpackChunkbmg_web_app=self.webpackChunkbmg_web_app||[]).push([[351],{7562:function(e,t,n){var o=n(1413),r=n(2791),a=n(6871),i=n(374),s=n(184);t.Z=function(e,t){return function(n){var l=(0,r.useContext)(i.V),c=(0,a.s0)(),d=l.userToken;return(0,r.useEffect)((function(){"undefined"!==typeof window&&(d?-1===(null===t||void 0===t?void 0:t.indexOf(l.userRole))&&c("/403",{replace:!0}):c("/auth",{replace:!0}))}),[d,l.userRole,c]),"undefined"!==typeof window?l.isLoading?(console.log("loading from with auth"),null):(0,s.jsx)(e,(0,o.Z)({},n)):null}}},1351:function(e,t,n){n.r(t);var o=n(5861),r=n(1413),a=n(9439),i=n(7757),s=n.n(i),l=n(2791),c=n(8735),d=n(5303),u=n(6755),h=n(7496),p=n(3695),x=n(8164),f=n(4980),m=n(3099),g=n(7528),j=n(7309),y=n(5696),v=n(2567),Z=n(7562),b=n(6208),k=n(374),w=n(3853),_=n(7425),C=n(2426),S=n.n(C),D=n(4971),I=n(9353),T=n.n(I),O=n(8206),Y=n(4569),z=n.n(Y),P=n(184),E=c.Z.Title,L=c.Z.Text,F=d.Z.Option,A=function(e){var t=e.label,n=e.children;return(0,P.jsxs)("div",{style:{display:"flex",flexDirection:"column",marginBottom:"14px"},children:[(0,P.jsx)(L,{type:"secondary",children:t}),(0,P.jsx)(E,{level:5,style:{marginTop:"0px"},children:n})]})},B=function(e){var t=e.label,n=e.image,o=e.time;return(0,P.jsxs)("div",{style:{display:"flex",flexDirection:"column",marginBottom:"14px"},children:[(0,P.jsx)(L,{type:"secondary",children:t}),null===o?(0,P.jsx)(L,{children:"No Photo"}):(0,P.jsx)("div",{style:{width:300,height:200,overflow:"hidden"},children:(0,P.jsx)(u.Z,{width:300,src:n})})]})},M=function(e){return S()(e).format("YYYY-MM-DD")};t.default=(0,Z.Z)((function(){var e,t,n,i=(0,l.useContext)(k.V).signOut,c=(0,l.useContext)(k.V),d=(0,l.useState)({page:1,fromdate:M(c.firstDate),todate:M(c.lastDate),update:!1}),u=(0,a.Z)(d,2),Z=u[0],C=u[1],I=(0,l.useState)(20),Y=(0,a.Z)(I,2),N=Y[0],R=Y[1],V=(0,l.useState)(""),q=(0,a.Z)(V,2),W=q[0],K=q[1],Q=(0,b.cF)("attendance?emp_id=".concat(W,"&from=").concat(Z.fromdate,"&to=").concat(Z.todate,"&page=").concat(Z.page,"&perpage=").concat(N),Z.update),H=Q.data,J=Q.pagination,U=Q.loading,G=(0,b.KQ)("employee"),X=G.data,$=G.loading,ee=(0,l.useState)([M(c.firstDate),M(c.lastDate)]),te=(0,a.Z)(ee,2),ne=te[0],oe=te[1],re=(0,l.useState)({}),ae=(0,a.Z)(re,2),ie=ae[0],se=ae[1],le=(0,l.useState)(!1),ce=(0,a.Z)(le,2),de=ce[0],ue=ce[1],he=h.Z.useForm(),pe=(0,a.Z)(he,1)[0],xe=(0,b.qY)(),fe=xe.isOpen,me=xe.onOpen,ge=xe.onClose;(0,l.useEffect)((function(){pe.setFieldsValue({date:[S()(c.firstDate),S()(c.lastDate)]})}),[]);var je=function(){var e=(0,o.Z)(s().mark((function e(){var t,n;return s().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return ue(!0),e.prev=1,e.next=4,z().get("".concat(O.F,"/api/attendance/export?emp_id=").concat(W,"&from=").concat(Z.fromdate,"&to=").concat(Z.todate),{headers:{Authorization:"bearer ".concat(c.userToken)},responseType:"blob"});case 4:if(t=e.sent){e.next=7;break}throw new Error;case 7:p.ZP.success("Download in progress"),T()(t.data,"Attendance.xlsx"),console.log("fetch data /attendance/export?emp_id=".concat(W,"&from=").concat(Z.fromdate,"&to=").concat(Z.todate)),ue(!1),e.next=26;break;case 13:if(e.prev=13,e.t0=e.catch(1),500!==(null===(n=e.t0.response)||void 0===n?void 0:n.status)){e.next=19;break}return p.ZP.error("".concat(e.t0.response.status,", ").concat(e.t0.response.statusText)),i(),e.abrupt("return",null);case 19:if(!e.t0.response){e.next=23;break}return p.ZP.error("".concat(e.t0.response.status,", ").concat(e.t0.response.statusText)),ue(!1),e.abrupt("return",null);case 23:p.ZP.error("Something went wrong, please try again.."),console.log(e.t0),ue(!1);case 26:case"end":return e.stop()}}),e,null,[[1,13]])})));return function(){return e.apply(this,arguments)}}(),ye=[{title:"#",dataIndex:"id",width:70},{title:"Name",dataIndex:"employe",render:function(e,t){return(0,P.jsx)(L,{strong:!0,style:{cursor:"pointer"},onClick:function(){se(t),me()},children:e})},ellipsis:!0},{title:"Site",dataIndex:"site_name",responsive:["lg"]},{title:"Date",dataIndex:"check_in",render:function(e){return null===e||void 0===e?void 0:e.substr(0,10)}},{title:"In",dataIndex:"check_in",render:function(e){return null===e||void 0===e?void 0:e.substr(11,5)}},{title:"Out",dataIndex:"check_out",render:function(e){return null===e?"Not yet out":e.substr(11,5)}}];return(0,P.jsxs)("div",{children:[(0,P.jsx)(x.Z,{style:{margin:"16px 0"},children:(0,P.jsx)(x.Z.Item,{children:"Attendance"})}),(0,P.jsxs)(f.Z,{title:ie.employe,visible:fe,onCancel:ge,footer:!1,children:[(0,P.jsxs)(v.Ej,{style:{marginBottom:"14px"},children:[(0,P.jsx)("div",{children:(0,P.jsx)(L,{strong:!0,style:{fontSize:18},children:null===(e=ie.check_in)||void 0===e?void 0:e.substr(0,10)})}),(0,P.jsx)("div",{children:(0,P.jsxs)(m.Z,{children:[(0,P.jsx)(g.Z,{color:D.nq,children:(0,P.jsxs)(L,{strong:!0,style:{fontSize:16,color:"white"},children:["IN ",null===(t=ie.check_in)||void 0===t?void 0:t.substr(11,5)]})}),(0,P.jsx)(g.Z,{color:D.E7,children:(0,P.jsxs)(L,{strong:!0,style:{fontSize:16,color:"white"},children:["OUT"," ",null===ie.check_out?"-":null===(n=ie.check_out)||void 0===n?void 0:n.substr(11,5)]})})]})})]}),(0,P.jsx)(B,{label:"Photo In",image:ie.check_in_photo}),(0,P.jsxs)(A,{label:"Coordinate In",children:["Lat: ",ie.check_in_lat,", Lng: ",ie.check_in_long]}),(0,P.jsx)(B,{label:"Photo Out",time:ie.check_out,image:ie.check_out_photo}),(0,P.jsxs)(A,{label:"Coordinate Out",children:["Lat: ",ie.check_out_lat,", Lng: ",ie.check_out_long]})]}),(0,P.jsx)("div",{children:(0,P.jsxs)(v.Zb,{children:[(0,P.jsx)(E,{level:4,type:"secondary",children:"Attendance"}),(0,P.jsxs)(v.Ej,{children:[(0,P.jsx)(h.Z,{form:pe,name:"form-attendance",autoComplete:"off",children:(0,P.jsxs)("div",{style:{display:"flex",flexDirection:"row"},children:[(0,P.jsx)(v.gH,{name:"date",required:!0,message:"please select date",onChange:function(e,t){return oe(t)},format:"YYYY-MM-DD"}),(0,P.jsx)(h.Z.Item,{children:(0,P.jsx)(j.Z,{type:"primary",shape:"round",icon:(0,P.jsx)(w.Ihx,{style:{marginRight:"6px"}}),onClick:function(){if(0===ne.length)return console.log("Form tidak bolah kosong"),null;C((0,r.Z)((0,r.Z)({},Z),{},{page:1,fromdate:ne[0],todate:ne[1]}))},loading:U,htmlType:"submit",style:{marginLeft:16},children:"Show"})})]})}),(0,P.jsx)(v.Wy,{style:{marginBottom:14},children:(0,P.jsx)(j.Z,{shape:"round",icon:(0,P.jsx)(_.WlY,{style:{marginRight:"6px"}}),onClick:je,loading:de,children:"Export"})})]}),(0,P.jsx)("div",{style:{display:"flex",flexDirection:"row"},children:(0,P.jsx)(v.ih,{name:"empId",placeholder:"filter employee",onChange:function(e){return K(e)},loading:$,disabled:$,style:{minWidth:290},children:X.map((function(e){return(0,P.jsx)(F,{value:e.id,children:"[".concat(e.id,"] ").concat(e.name)},e.id)}))})}),(0,P.jsx)(y.Z,{columns:ye,dataSource:H,rowKey:function(e){return e.id},loading:U,scroll:{y:500},pagination:{total:J.total_data,showTotal:function(e,t){return"".concat(t[0],"-").concat(t[1]," of ").concat(e," items")},showQuickJumper:!0,defaultCurrent:1,onChange:function(e){return C((0,r.Z)((0,r.Z)({},Z),{},{page:e}))},showSizeChanger:!0,onShowSizeChange:function(e,t){return R(t)},defaultPageSize:N,pageSizeOptions:[20,60,100,140]}})]})})]})}))}}]);
//# sourceMappingURL=351.10e5b9dc.chunk.js.map