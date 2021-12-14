#include "medium/medium.hpp"

#include "medium/homogeneous_medium.hpp"
#include <stdio.h>
#include "intersect/ray.hpp"
#include "sampling/sampler.hpp"
#include "scene/interaction.hpp"
#include "medium/heterogenous_medium.hpp"
#include "medium/nvdb_medium.hpp"
#include "medium/phase_function.hpp"

namespace rt {
  CMedium::CMedium(const EMediumType type) :
    m_type(type) {

  }

  OptixProgramGroup CMedium::getOptixProgramGroup() const {
    switch (m_type) {
    case NVDB_MEDIUM:
      return static_cast<const CNVDBMedium*>(this)->getOptixProgramGroup();
    }
    fprintf(stderr, "[ERROR] No OptixProgramGroup found for given medium type\n");
    return OptixProgramGroup();
  }
}