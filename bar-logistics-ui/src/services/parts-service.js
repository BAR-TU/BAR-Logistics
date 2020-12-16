import axios from 'axios'

const API_URL = 'http://localhost:8080/parts'

class PartsService {
  getAllParts () {
    return axios.get(API_URL + '/all')
  }

  getPartsPage (filters, currentPage, perPage) {
    return axios.get(API_URL + '/search/pages', { params: { currentPage: currentPage, perPage: perPage, part_num: filters.part_num, part_name: filters.part_name } })
  }
}

export default new PartsService()
